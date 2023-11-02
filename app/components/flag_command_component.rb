# frozen_string_literal: true

class FlagCommandComponent < ViewComponent::Base
  attr_accessor :flag, :type, :checked, :target, :icon

  def initialize(flag:, type:, **options)
    super
    @flag = flag
    @type = type
    @checked = options[:checked].presence || false
    @target = options[:target]
    @icon = options[:icon]
  end

  def input_classes
    "w-6 h-6 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600 hover:cursor-pointer"
  end

  def label_classes
    "w-full flex justify-center items-center gap-12 py-2 text-slate-200 dark:text-gray-300 hover:cursor-pointer"
  end

  def container_classes
    "flex items-center gap-16 px-8 py-3 hover:bg-slate-600 hover:cursor-pointer"
  end

  def input_id
    "group-#{@target}-#{@flag}"
  end

  def name
    @target
  end
end

