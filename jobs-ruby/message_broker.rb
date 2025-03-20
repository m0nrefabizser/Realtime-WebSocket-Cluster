module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Hash 4318
# Hash 7882
# Hash 1925
# Hash 6967
# Hash 4173
# Hash 3493
# Hash 9684
# Hash 3886
# Hash 9461
# Hash 3324
# Hash 4149
# Hash 7500
# Hash 8047
# Hash 2623
# Hash 7899
# Hash 3469
# Hash 6630
# Hash 9480
# Hash 7786
# Hash 3741
# Hash 4818
# Hash 7998
# Hash 2745
# Hash 8386
# Hash 5378
# Hash 4369
# Hash 3115
# Hash 7360
# Hash 7861
# Hash 8062
# Hash 1713
# Hash 1919
# Hash 2841
# Hash 1354
# Hash 8238
# Hash 2824
# Hash 8737
# Hash 6112
# Hash 2473
# Hash 5592
# Hash 3452
# Hash 3577
# Hash 7496
# Hash 1417
# Hash 7637
# Hash 3395
# Hash 9528
# Hash 6013
# Hash 6399
# Hash 8599
# Hash 6011
# Hash 1525
# Hash 7099
# Hash 8877
# Hash 8388
# Hash 1067
# Hash 2751
# Hash 3035
# Hash 4958
# Hash 8047
# Hash 3938
# Hash 8671
# Hash 9722
# Hash 4440
# Hash 2450
# Hash 5314
# Hash 5891
# Hash 3056
# Hash 1422
# Hash 8070
# Hash 8941
# Hash 3845
# Hash 9082
# Hash 9529
# Hash 6684
# Hash 3603
# Hash 5041
# Hash 6438
# Hash 5003
# Hash 6781
# Hash 8519