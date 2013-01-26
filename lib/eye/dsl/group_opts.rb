class Eye::Dsl::GroupOpts < Eye::Dsl::Opts

  include Eye::Dsl::Chain

  def disallow_options
    [:pid_file]
  end

  def process(name, &block)
    opts = Eye::Dsl::ProcessOpts.new(name, self)
    opts.instance_eval(&block)
    @config[:processes] ||= {}
    @config[:processes][name.to_s] = opts.config if opts.config
  end

  def xprocess(name, &block); end

  def application
    parent
  end
  alias :app :application

end
