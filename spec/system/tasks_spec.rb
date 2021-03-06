require "rails_helper"

describe "タスク管理機能", type: :system do
    
  describe "一覧表示機能" do
    context "ユーザAがログインしている場合" do
      # before内で書いた変数は当然ローカル変数。
      # ユーザA作成
      let(:user_a) {FactoryBot.create(:user)}
      # タスク作成
      let(:task_a) {FactoryBot.create(:task, user: user_a)}
      before do
        # ユーザAでログインする
        visit login_path
        fill_in "メールアドレス", with: user_a.email
        fill_in "パスワード", with: user_a.password
        click_button "ログインする"
      end

      it "ユーザAが作成したタスクが表示される" do
        # 作成済のタスクの名称が画面上に表示されていることを確認
        expect(page).to have_content task_a.name
      end
    end
  end
end
