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

      get "/api/v1/comments?api_key=#{user.api_key}&project=#{project.title.parameterize}"

      comments = JSON.parse(response.body)

      expect(response).to be_success
      expect(comments).to be_an(Array)
      expect(comments.first['user']['name']).to eq(commenter1.name)
      expect(comments.first['comment_body']).to eq('What a fantastic project!')
      expect(comments.last['user']['name']).to eq(commenter2.name)
      expect(comments.last['comment_body']).to eq('I wish you all the best of luck')
    end
  end
end
