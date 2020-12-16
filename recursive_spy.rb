class RecursiveSpy
  attr_reader :calls

  def initialize
    @calls = {}
  end

  def method_missing(method, *args)
    value = self.class.new
    @calls[method] ||= []
    @calls[method] << MethodInvocation.new(
      value,
      args
    )
    value
  end

  class MethodInvocation
    attr_reader :value, :args
    def initialize(value, args)
      @value = value
      @args = args
    end
  end
end
