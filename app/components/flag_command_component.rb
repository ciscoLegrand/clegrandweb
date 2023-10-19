# frozen_string_literal: true

class FlagCommandComponent < ViewComponent::Base
  attr_accessor :flag, :type, :checked

  def initialize(flag:, type:, checked:)
    super
    @flag = flag
    @type = type
    @checked = checked
  end
end
