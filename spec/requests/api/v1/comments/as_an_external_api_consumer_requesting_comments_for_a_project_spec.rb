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

      get "/api/v1/comments?api_key=#{user.api_key}&project=#{project.slug}"

      comments = JSON.parse(response.body)

      expect(response).to be_success
      expect(comments).to be_an(Array)
      expect(comments.first['user']['name']).to eq(commenter1.name)
      expect(comments.first['comment_body']).to eq('What a fantastic project!')
      expect(comments.last['user']['name']).to eq(commenter2.name)
      expect(comments.last['comment_body']).to eq('I wish you all the best of luck')
    end
  end

  context "Get /api/v1/comments without api_key" do
    it 'returns 401' do
      get '/api/v1/comments'

      expect(response).to have_http_status(401)
    end
  end

  context "Get /api/v1/comments no project found" do
    it 'returns no project found' do
      user = create(:user)
      nonexistent_project_slug = "blah-blah-blah"

      get "/api/v1/comments?api_key=#{user.api_key}&project=#{nonexistent_project_slug}"

      result = JSON.parse(response.body)
      
      expect(response).to have_http_status(404)
      expect(result).to eq({'error' => 'project not found'}) 
    end
  end

  context "Get /api/v1/comments for a project that a user is not a backer of" do
    xit 'returns 401' do
      user = create(:user)
      user2 = create(:user)
      project = create(:project, title: 'How to Find a Job')
      commenter1 = create(:user)
      commenter2 = create(:user)
      comment1 = create(:comment, user: commenter1, project: project, comment_body: "What a fantastic project!")
      comment2 = create(:comment, user: commenter2, project: project, comment_body: "I wish you all the best of luck")

      get "/api/v1/comments?api_key=#{user2.api_key}&project"
    end
  end
end
