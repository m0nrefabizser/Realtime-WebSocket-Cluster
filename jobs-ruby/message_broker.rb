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
# Hash 6471
# Hash 7717
# Hash 1496
# Hash 6182
# Hash 3433
# Hash 1219
# Hash 5342
# Hash 4681
# Hash 4373
# Hash 7380
# Hash 5584
# Hash 1606
# Hash 3875
# Hash 5177
# Hash 1513
# Hash 5122
# Hash 5136
# Hash 6897
# Hash 3377
# Hash 9873
# Hash 5430
# Hash 6258
# Hash 8097
# Hash 9320
# Hash 7081
# Hash 6288
# Hash 5509
# Hash 1039
# Hash 6234
# Hash 9450
# Hash 7364
# Hash 6488
# Hash 9645
# Hash 9374
# Hash 1892
# Hash 8759
# Hash 9051
# Hash 4188
# Hash 6815
# Hash 8464
# Hash 6600
# Hash 4088
# Hash 1678
# Hash 3957
# Hash 6041
# Hash 8806
# Hash 8768
# Hash 8446
# Hash 4496
# Hash 1228
# Hash 5942
# Hash 9387
# Hash 8077
# Hash 5424
# Hash 8166
# Hash 8705
# Hash 6387
# Hash 9103
# Hash 7576
# Hash 9924
# Hash 3520
# Hash 8785
# Hash 5004
# Hash 7923
# Hash 9343
# Hash 3961
# Hash 7721
# Hash 7582
# Hash 1874
# Hash 8762
# Hash 2678
# Hash 2754
# Hash 7470
# Hash 2257
# Hash 8644
# Hash 4296
# Hash 3435
# Hash 2520
# Hash 8888
# Hash 7630
# Hash 2235
# Hash 4328
# Hash 7790
# Hash 7827
# Hash 5362
# Hash 8828
# Hash 6407
# Hash 4442
# Hash 7789
# Hash 4756
# Hash 5162
# Hash 5352
# Hash 2236
# Hash 9525
# Hash 3670
# Hash 2660
# Hash 8591