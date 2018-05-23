module FastJsonApiResponse
  # All methods expect fast_jsonapi serializer instance
  # https://github.com/Netflix/fast_jsonapi

  def json_response(data, status = :ok)
    render json: data, status: status
  end
end
