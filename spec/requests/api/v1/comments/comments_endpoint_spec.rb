require 'rails_helper'

describe "comments endpoint" do
  context 'GET /api/v1/comments?api_key=xxxxx&project=how-to-find-a-job' do
    it 'returns a collection of comments' do
      user = create(:user)
      project = create(:project, title: 'How to Find a Job')
      commenter1 = create(:user)
      commenter2 = create(:user)
      comment1 = create(:comment, user: commenter1, project: project, comment_body: "What a fantastic project!")
      comment2 = create(:comment, user: commenter2, project: project, comment_body: "I wish you all the best of luck")

      get "/api/v1/projects/#{project.slug}/comments?api_key=#{user.api_key}"

      comments = JSON.parse(response.body)

      expect(response).to be_success
      expect(comments).to be_an(Array)
      expect(comments.first['user']['name']).to eq(commenter1.name)
      expect(comments.first['comment_body']).to eq('What a fantastic project!')
      expect(comments.last['user']['name']).to eq(commenter2.name)
      expect(comments.last['comment_body']).to eq('I wish you all the best of luck')
    end
  end

  context "Get /api/v1/projects/:project/comments without api_key" do
    it 'returns 401' do
      project = create(:project, title: 'How to Find a Job')

      get "/api/v1/projects/#{project.slug}/comments"

      expect(response).to have_http_status(401)
    end
  end

  context "Get /api/v1/projects/comments no project found" do
    it 'returns no project found' do
      user = create(:user)
      nonexistent_project_slug = "blah-blah-blah"

      get "/api/v1/projects/#{nonexistent_project_slug}/comments?api_key=#{user.api_key}"

      result = JSON.parse(response.body)

      expect(response).to have_http_status(404)
      expect(result).to eq({'error' => 'project not found'})
    end
  end

  context "POST /api/v1/projects/:project/comments as a backer of the project" do
    it 'creates a new comment' do
      user = create(:user)
      project = create(:project, title: 'How to Find a Job')
      create(:pledge, user: user, project: project)
      comment = create(:comment, user: user, project: project, comment_body: "What a fantastic project!")

      get "/api/v1/projects/:project/comments?api_key=#{user.api_key}"

      first_result = JSON.parse(response.body)

      expect(first_result.count).to eq(1)

      data = { comment: 'What a great day!!!' }
      post "/api/v1/projects/#{project.slug}/comments?api_key=#{user.api_key}", data.to_json, { 'CONTENT_TYPE' => 'application/json'}

      post_result = JSON.parse(response.body)

      expect(response).to have_http_status(201)

      get "/api/v1/projects/#{project.slug}/comments?api_key=#{user.api_key}"

      second_result = JSON.parse(response.body)

      expect(second_result.count).to eq(2)
    end
  end

  context "POST /api/v1/projects/:project/comments with no wrong api_key" do
    it 'returns unauthorized' do
      not_a_key = '357893754nfds74'
      project = create(:project, title: 'How to Find a Job')
      data = { comment: 'What a great day!!!' }
      post "/api/v1/projects/#{project.slug}/comments?api_key=#{not_a_key}", data.to_json, { 'CONTENT_TYPE' => 'application/json'}

      error = JSON.parse(response.body)

      expect(response).to have_http_status(401)
      expect(error).to eq({'error' => 'unauthorized'})
    end
  end

  context "POST /api/v1/projects/:project/comments with user not a backer" do
    it 'returns unauthorized' do
      not_a_key = '357893754nfds74'
      user = create(:user)
      project = create(:project, title: 'How to Find a Job')

      data = { comment: 'What a great day!!!' }
      post "/api/v1/projects/#{project.slug}/comments?api_key=#{user.api_key}", data.to_json, { 'CONTENT_TYPE' => 'application/json'}

      error = JSON.parse(response.body)

      expect(response).to have_http_status(401)
      expect(error).to eq({'error' => 'you are not backer of this project'})
    end
  end
end
