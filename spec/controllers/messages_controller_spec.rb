require "rails_helper"

RSpec.describe MessagesController, type: :controller do
  let(:user) { create(:user) }
  before { sign_in user }

  describe "GET index" do
    let(:groups)     { create_list(:group, 2, user_ids: user.id) }
    let(:get_params) { get :index }
    before { get :index }

    context "when user sign_in" do
      it "renders the index template" do
        expect(response).to render_template :index
      end

      it "assigns the requested contact to @groups" do
        expect(assigns(:groups)).to eq groups
      end
    end

    context "when user didn't sign_in" do
      before { sign_out user }
      it "redirects to new_user_session" do
        get_params
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe "GET new" do
    let(:group)      { create(:group, user_ids: user.id) }
    let(:message)    { create(:message, params: { group_id: group.id, user_id: user.id }) }
    let(:messages)   { create_list(:message, 2, group_id: group.id) }
    let(:get_params) { get :new, params: { group_id: group.id } }
    before { get :new, params: { group_id: group.id } }

    context "when user sign_in" do
      it "renders the new template" do
        expect(response).to render_template :new
      end

      it "assigns the requested contact to @group" do
        expect(assigns(:group)).to eq group
      end

      it "assigns the requested contact to @messages" do
        expect(assigns(:messages)).to eq messages
      end
    end

    context "when user didn't sign_in" do
      before { sign_out user }
      it "redirects to new_user_session" do
        get_params
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe "POST create" do
    let(:group)                  { create(:group, user_ids: user.id) }
    let(:message)                { create(:message, group_id: group.id, user_id: user.id) }
    let(:success_message_params) { post :create, params: { message: attributes_for(:message), group_id: group.id } }
    let(:fail_message_params)    { post :create, params: { message: attributes_for(:message, body: ""), group_id: group.id } }

    context "when user sign_in" do
      context "success send message" do
        it "message save" do
          expect{ success_message_params }.to change(Message, :count).by(1)
        end

        it "renders flash notice message" do
          success_message_params
          expect(flash.now[:notice]).to eq "メッセージの送信に成功しました"
        end

        it "redirects to message#new" do
          success_message_params
          expect(response).to redirect_to new_group_message_path
        end
      end

      context "fail send message" do
        it "message not save" do
          expect{ fail_message_params }.not_to change(Message, :count)
        end

        it "renders flash error message" do
          fail_message_params
          expect(flash.now[:alert]).to eq "メッセージの送信に失敗しました"
        end

        it "renders the new template" do
          fail_message_params
          expect(response).to render_template :new
        end
      end
    end

    context "when user didn't sign_in" do
      before { sign_out user }
      it "redirects to new_user_session" do
        success_message_params
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end

