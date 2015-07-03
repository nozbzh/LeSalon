module ApplicationHelper

  def number_to_currency_fr(number)
    number_to_currency(number, :unit => "", :separator => ",", :delimiter => " ", :precision => 0)
  end

end
