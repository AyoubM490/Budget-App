class RecordsController < ApplicationController
  before_action :set_record, only: %i[show edit update destroy]

  def index
    set_group
    @records = Record.where(author_ir: current_user.id).where(groups_id: params[:group_id])
  end

  def show; end

  def new
    set_group
    @record = Record.new
  end

  def edit; end

  def create
    set_group
    @record = current_user.records.new(record_params)

    respond_to do |format|
      if @record.save
        format.html { redirect_to group_records_path(@group), notice: 'Record was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    set_record

    respond_to do |format|
      if @record.update(record_params)
        format.html { redirect_to record_url(@record), notice: 'Record was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    set_group
    @record.destroy

    respond_to do |format|
      format.html { redirect_to group_records_path(@group), notice: 'Record was successfully destroyed.' }
    end
  end

  private

  def set_record
    @record = Record.find(params[:id])
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  def record_params
    params.require(:record).permit(:name, :amount, :group_id)
  end
end
