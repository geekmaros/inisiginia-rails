# frozen_string_literal: true

class InputComponent < ViewComponent::Base
  def initialize(form:, label:, type:, attribute:, model:, placeholder: "", custom_class: "", options: {}, external_error_message: nil)
    @form = form
    @label = label
    @type = type
    @attribute = attribute
    @model = model
    @placeholder = placeholder
    @custom_class = custom_class
    @options = options
    @external_error_message = external_error_message
  end

  def error_message
    @external_error_message.presence || @model.errors[@attribute]&.first
  end
  def has_error?
    @external_error_message.present? || @model.errors[@attribute].present?
  end
end
