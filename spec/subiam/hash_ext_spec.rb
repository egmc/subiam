describe 'Hash#sort_array!' do
  let(:hash) do
    {:users=>
      {"bob"=>
        {:path=>"/devloper/",
         :groups=>[],
         :policies=>
          {"S3"=>
            {"Statement"=>
              [{"Action"=>["s3:Put*", "s3:List*", "s3:Get*"],
                "Effect"=>"Allow",
                "Resource"=>"*"}]}},
         :attached_managed_policies=>[
          "arn:aws:iam::aws:policy/AmazonElastiCacheReadOnlyAccess",
          "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"],
         :login_profile=>{:password_reset_required=>true}}}}
  end

  let(:expected_hash) do
    {:users=>
      {"bob"=>
        {:path=>"/devloper/",
         :groups=>[],
         :policies=>
          {"S3"=>
            {"Statement"=>
              [{"Action"=>["s3:Get*", "s3:List*", "s3:Put*"],
                "Effect"=>"Allow",
                "Resource"=>"*"}]}},
         :attached_managed_policies=>[
          "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess",
          "arn:aws:iam::aws:policy/AmazonElastiCacheReadOnlyAccess"],
         :login_profile=>{:password_reset_required=>true}}}}
  end

  subject { hash.sort_array! }

  it { is_expected.to eq expected_hash }
end

describe 'Hash#keys_to_s_recursive' do
  let(:hash) do
    {S3:
         {Statement:
              [{Action: ["s3:Put*", "s3:List*", "s3:Get*"],
                Effect: "Allow",
                Resource: "*"}]}}
  end

  let(:expected_hash) do
    {"S3" =>
         {"Statement" =>
              [{"Action" => ["s3:Put*", "s3:List*", "s3:Get*"],
                "Effect" => "Allow",
                "Resource" => "*"}]}}
  end

  subject { hash.keys_to_s_recursive }

  it { is_expected.to eq expected_hash }
end
