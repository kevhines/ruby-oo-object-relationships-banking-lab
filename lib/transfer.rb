class Transfer
  # your code here

  attr_accessor :status, :amount
  attr_reader :sender, :receiver


    def initialize(sender, receiver, amount)
      @sender = sender
      @receiver = receiver
      self.status = "pending"
      self.amount = amount
    end

      def valid?
        @sender.valid? && @receiver.valid?
      end


      def execute_transaction
        if self.valid? && self.status == "pending" && sender.balance > self.amount
          sender.balance -= self.amount
          receiver.balance += self.amount
          self.status = "complete"
        else
          self.status = "rejected"
          "Transaction rejected. Please check your account balance."
        end

      end


      def reverse_transfer
        if self.status == "complete"
          sender.balance += self.amount
          receiver.balance -= self.amount
          self.status = "reversed"
        end
      end




end
