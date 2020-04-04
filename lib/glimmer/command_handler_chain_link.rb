module Glimmer
  class CommandHandlerChainLink
    def initialize(command_handler)
      @command_handler = command_handler
    end
    def chain_to(next_chain_link)
      @next_chain_link = next_chain_link
    end
    def handle(parent, command_symbol, *args, &block)
      if (@command_handler.can_handle?(parent, command_symbol, *args, &block))
        Glimmer.logger.debug "#{@command_handler.class.to_s} will handle command: #{command_symbol} with arguments #{args}"
        return @command_handler.do_handle(parent, command_symbol, *args, &block)
      elsif @next_chain_link
        return @next_chain_link.handle(parent, command_symbol, *args, &block)
      else
        # TODO see if we need a better response here (e.g. dev mode error raising vs production mode silent failure)
        message = "Glimmer keyword #{command_symbol} with args #{args} cannot be handled"
        message += " inside parent #{parent.inspect}" if parent
        message += "! Check the validity of the code."
        # Glimmer.logger.error message
        raise message
      end
    end
  end
end