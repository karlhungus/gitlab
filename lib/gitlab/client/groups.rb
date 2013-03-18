class Gitlab::Client
  # Defines methods related to groups.
  module Groups
    def groups
      get("/groups")
    end

    def group(group_id)
      get("/groups/#{group_id}")
    end

    # Creates a new group
    #
    # @param  [String] name (required) :
    # @option options [String] :path the path to use for the group (defaults to downcased name)
    # @option options [Integer] :owner the owner of the group (defaults to authenticated user)
    def create_group(name, options={})
      body = {:name => name}.merge(options)
      post("/groups", :body => body)
    end

    # Transfers a project to a group
    #
    # @param  [Integer] group_id
    # @param  [Integer] project_id
    def transfer_project_to_group(group_id, project_id)
      body = {:id => group_id, :project_id => project_id}
      post("/groups/#{group_id}/projects/#{project_id}", :body => body)
    end


    # Creates a new issue.
    #
    # @param  [Integer] group_id
    # @param  [Integer] project_id
    def transfer_project_to_group(group_id, project_id)
      body = {:id => group_id, :project_id => project_id}
      post("/groups/#{group_id}/projects/#{project_id}", :body => body)
    end
  end
end
