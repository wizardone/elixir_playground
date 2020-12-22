defprotocol Size do
  @spec calculate(t) :: Integer.t()
  def calculate(value)
end
