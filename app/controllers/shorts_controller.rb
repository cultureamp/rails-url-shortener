#
# Controller for Short actions including lookup
#
class ShortsController < ApplicationController
  include Authentication

  before_action :authenticate!,   only: %i[destroy]
  before_action :load_short,      only: %i[destroy show]
  before_action :authorize!,      only: %i[destroy]
  before_action :validate_params, only: %i[create]

  def show
    redirect_to(@short.full_url)
  end

  def create
    details = { full_url: params[:full_url] }
    if params[:short_url].present?
      details[:short_url]      = params[:short_url].downcase
      details[:user_generated] = true
    end

    @short = Short.create(details)
    return render(json: @short.marshall, status: 200) if @short.valid?

    errs = @short.errors.map(&:full_message)
    render(json: { message: I18n.t('errors.400'), errors: errs }, status: 400)
  end

  def destroy
    status = @short.destroy ? 200 : 400
    render(plain: '', status: status)
  end

  private

  def load_short
    @short = Short.find_by(short_url: params[:id])
    return nil if @short.present?

    render_error(404)
  end

  def validate_params
    return nil if short_params.key?(:full_url)

    render_error(400)
  end

  def short_params
    params.permit(:full_url, :short_url)
  end

  def authorize!
    token_for_request = @short.uuid == @authorized_for[:uuid]
    token_times_match = (@authorized_for[:iat] - @short.created_at.to_i) < 10

    return nil if token_for_request && token_times_match

    render_error(401)
  end
end
