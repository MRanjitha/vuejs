class NavController < ApplicationController
  def index
  	@@col = 1
    @scheme = NavHistory.select("distinct(scheme_name)").map(&:scheme_name).uniq
  end

  def add_row
  	@@col += 1
  	@col = @@col
    @scheme = NavHistory.select("distinct(scheme_name)").map(&:scheme_name).uniq
    p @col
    p @@col
    # render :json => {:col => @col}
  end

  def calc_nav
    p "11111111111111111"
  	@purchase_date = params['amt']
    puts "================================================="
    puts "date = #{@purchase_date}"
    @inv_amt = params["amt_1"]
  	@scheme_name = params["scheme_name_1"]
  	@today_date = Date.parse('2017-06-15')
  	@col = add_row
    p "qqqqqqqqqqqqqqqq"
  	p @col
  	p @purchase_date
  	p @inv_amt
  	p @scheme_name
  	p @today_date
  	@total_investment_amt = 0
  	@total_value = 0

  	for i in 1..(@@col)
      p "iiiiiiiiiii"
      i = i.to_s
      p i
  		purchase_date = Date.parse(params['date_#{i}'])
	  	inv_amt = params['amt_#{i}'].to_i
	  	scheme_name = params['scheme_name_#{i}']
	  	today_date = Date.parse('2017-06-15')
	  	@total_investment_amt += inv_amt
  		@total_value += calculate_nav(purchase_date, inv_amt, scheme_name, today_date)
      p "yessssssssssssssssssss"
      p @total_value
  	end
    
  end

  private

  def calculate_nav(purchase_date, inv_amt, scheme_name, today_date)
    p "2222222222222222"
  	scheme_old = NavHistory.where("scheme_name = ? and date = ?", scheme_name, purchase_date)[0]
  	nav_for_the_day = scheme_old.nav
  	shares = (inv_amt/nav_for_the_day).round(2)
  	scheme_current = NavHistory.where("scheme_name = ? and date = ?", scheme_name, today_date)[0]
  	nav_for_current_day = scheme_current.nav
  	investment_value = (shares * nav_for_current_day).ceil

  	return investment_value

  end
end
