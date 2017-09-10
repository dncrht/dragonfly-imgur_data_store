require 'spec_helper'
require 'dragonfly/imgur_data_store'

RSpec.describe Dragonfly::ImgurDataStore do

  let(:sample_file) { File.read('sample.jpg') }

  let(:app) { Dragonfly.app }
  let(:content) { Dragonfly::Content.new(app, sample_file) }
  let(:content2) { Dragonfly::Content.new(app, sample_file) }

  it 'does an integration test by uploading, retrieving and deleting an image' do
    configuration = YAML.load(File.read('config/imgur.yml'))
    data_store = described_class.new(configuration)

    # Upload first image
    uid1 = data_store.write(content)

    # Upload second image
    uid2 = data_store.write(content2)

    # Returns a unique identifier for each image
    expect(uid1).to_not be uid2

    # Retrieve an image
    # TODO imgur does processing, it won't be the same as the original
    # expect(data_store.read(uid1)).to eq sample_file
    # Test url instead

    # Delete both images
    data_store.destroy(uid1)
    data_store.destroy(uid2)

    # Does nothing if the data doesn't exist on destroy
    data_store.destroy(uid1)
    data_store.destroy(uid2)

    # Returns nil when the image does not exist
    expect(data_store.read(uid1)).to be_nil
    expect(data_store.read(uid2)).to be_nil
  end
end
