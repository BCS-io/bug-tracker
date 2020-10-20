module Projects
  module Issues
    class CommentsController < CommentsController
      before_action :set_commentable

      def create
        super
        @commentable.events.create(action: controller_path.parameterize.underscore,
                                   eventable: @comment)
      end

      private

      def set_commentable
        @commentable = Issue.find(params[:issue_id])
      end
    end
  end
end
