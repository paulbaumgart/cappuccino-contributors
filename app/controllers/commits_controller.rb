class CommitsController < ApplicationController
  before_filter :set_contributor
  before_filter :set_since

  caches_action :index, :if => lambda { |c| !c.params[:since].present? } 

  def index
    @commits = @contributor.commits_since(@since)
  end

private
  def set_contributor
    @contributor = Contributor.find_by_url_id(params[:contributor_id])
    redirect_to contributors_url if not @contributor
  end
end
