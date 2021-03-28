module CommentsHelper
  def self.generate_error_messages(comment)
    error_details ||= []
    comment.errors.objects.each do |err|
      error_details << err.full_message
    end
    error_details
  end
end
