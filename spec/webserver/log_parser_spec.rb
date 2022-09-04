# frozen_string_literal: true

require "./spec/spec_helper.rb"

RSpec.describe Webserver::LogParser do
  it "has a version number" do
    expect(Webserver::Parser::VERSION).not_to be nil
  end

  context "with correct file given" do
    let(:log_file) { "spec/fixtures/webserver.log" }

    let(:expected_parsing_result) do
      { page_views: ["/about/2 90 views",
                     "/contact 89 views",
                     "/index 82 views",
                     "/about 81 views",
                     "/help_page/1 80 views",
                     "/home 78 views"],
        unique_page_views: ["/help_page/1 23 unique views",
                            "/contact 23 unique views",
                            "/home 23 unique views",
                            "/index 23 unique views",
                            "/about/2 22 unique views",
                            "/about 21 unique views"] }
    end

    it "correctly parses a log file" do
      expect(described_class.new.parse(log_file)).to eq(expected_parsing_result)
    end
  end

  context "with wrong file given" do
    let(:log_file) { "non-existent" }

    it "raises an exception" do
      expect { described_class.new.parse(log_file) }.to raise_exception(Errno::ENOENT)
    end
  end
end
