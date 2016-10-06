RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  # PAPER_TRAIL_AUDIT_MODEL = ['BlogPost']
  # config.actions do
  #   history_index do
  #     only PAPER_TRAIL_AUDIT_MODEL
  #   end
  #   history_show do
  #     only PAPER_TRAIL_AUDIT_MODEL
  #   end
  # end

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar true


  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    history_index
    history_show

    ## Issues
    nestable
  end

  config.model BlogPost do
    edit do
      field :title
      field :users do
        label "Authors"
        help "Required - who wrote this blog post?"
      end
      field :body, :ck_editor
      fields_of_type :tag_list do
        label "Tags"
        # partial "tag_list_with_autocomplete"
      end
      field :tag_list
      field :legal_cases
      field :published
      field :promoted
    end
  end

  config.model LegalCase do
    edit do
      field :title
    end
  end

  config.model Issue do
    nestable_tree({
      position_field: :position
      })
    edit do
      field :name
      field :body, :ck_editor
    end
  end
end
