module ApplicationHelper

  def number_to_currency_fr(number)
    number_to_currency(number, :unit => "", :separator => ",", :delimiter => " ")
  end

end
