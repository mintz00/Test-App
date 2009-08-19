class ProgramsController < ApplicationController
  def show
    condition_id = Program.find(params[:id]).condition.id
    @programs = Program.find(:all,:conditions => "condition_id = #{condition_id}")

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @programs }
    end
  end

  def create
  @meal = Meal.find_by_name(params[:meal][:name])
  @condition = Condition.find_by_name(params[:condition][:name])
  @program = Program.new
  @program.meal_id = @meal.id
  @program.condition_id = @condition.id
  @program.save()

    respond_to do |format|
      if @program.save
        flash[:notice] = 'Program was successfully created.'
        format.html { redirect_to(@program) }
        format.xml  { render :xml => @program, :status => :created, :location => @program }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @program.errors, :status => :unprocessable_entity }
      end
    end
  end

   def new
    @program = Program.new
    @condition = @program.create_condition
    @meal = @program.create_meal

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @program }
    end
  end

  def edit
  end

end
