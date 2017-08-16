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
    import

    ## With an audit adapter, you can add:
    history_index
    history_show

    ## Issues
    nestable
  end

  config.configure_with(:import) do |config|
    config.logging = true
  end

  config.included_models = ['BlogPost', 'BlogPost::Translation', 'Issue', 'LegalCase', 'User']

  config.model "BlogPost" do
    edit do
      field :translations, :globalize_tabs

      field :id_from_kittens
      field :users do
        label "Authors"
        help "Required - who wrote this blog post?"
      end
      fields_of_type :tag_list do
        label "Tags"
        # partial "tag_list_with_autocomplete"
      end
      field :tag_list
      field :issues
      field :legal_cases
      field :published
      field :promoted
    end

    list do
      field :title
      field :published
      field :issues
    end

    import do
      mapping_key :id_from_kittens
    end
  end

  config.model "BlogPost::Translation" do
    configure :locale, :hidden do
      help ''
    end

    include_fields :locale, :title
    field :body, :ck_editor
  end

  config.model "LegalCase" do
    edit do
      field :title
      field :id_from_kittens
    end
    import do
      mapping_key :id_from_kittens
    end
  end

  config.model "Issue" do
    nestable_tree({
      position_field: :position
      })
    edit do
      field :name
      field :id_from_kittens
      field :body, :ck_editor
    end
    import do
      mapping_key :id_from_kittens
    end
    list do
      field :name
      field :body
    end
  end
end
