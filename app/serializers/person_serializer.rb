class PersonSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :phone, :error_messages

  def error_messages
    object.errors.full_messages.join(', ')
  end
end
