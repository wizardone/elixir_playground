defimpl Size, for: BitString do
  def calculate(value), do: Kernel.bit_size(value)
end

defimpl Size, for: Integer do
  def calculate(value), do: Integer.digits(value)
end
