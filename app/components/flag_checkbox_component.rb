# frozen_string_literal: true

class FlagCheckboxComponent < ViewComponent::Base
  attr_accessor :flag, :checked

  def initialize(flag:, checked:)
    super
    @flag = flag
    @checked = checked
  end
end
