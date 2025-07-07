class BaseService
    def self.call(*args, &block)
        new(*args, &block).call
    end

    private

    def call
        raise 'Not implemented'
    end
end