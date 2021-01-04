class MemosController < ApplicationController
  before_action :logged_in_user

  def index
    @user = current_user
    @memos = @user.memo.order(created_at: :desc)
  end

  def show
    @memo = Memo.find(params[:id])
  end

  def new
  end

  def create
    user = current_user
    @memo = Memo.new(memo_params)
    if @memo.subject == ''
      @memo.subject = '件名なし'
    end
    @memo.user_id = user.id
    if @memo.valid?
      @memo.save
    else
      flash[:danger] = 'メモを入力してください'
      redirect_to root_url
    end
  end

  def edit
    @memo = Memo.find(params[:id])
  end

  def update
    @memo = Memo.find(params[:id])
    @memo.subject = params[:memo][:subject]
    @memo.memo = params[:memo][:memo]
    if @memo.valid?
      @memo.save
      flash[:success] = '編集しました'
      redirect_to memo_url(@memo.id)
    else
      flash[:danger] = '編集に失敗しました'
      render :edit
    end
  end

  def destroy
    @memo = Memo.find(params[:id])
    @memo.destroy
    redirect_to root_url
  end

    private

      def memo_params
        params.permit(:subject,:memo)
      end 
end
