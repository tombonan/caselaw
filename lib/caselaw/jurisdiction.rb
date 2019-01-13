module Caselaw
  class Jurisdiction
    attr_accessor :name, :id, :slug

    def initialize(name, id, slug)
      self.name = name
      self.id = id
      self.slug = slug
    end

    def self.all
      [
        Jurisdiction.new('Alabama', 23, 'ala')
        Jurisdiction.new('Alaska', 53, 'alaska')
      ]
    end

    def self.get_by_name(name)
      all.find { |s| s.name.downcase == name.downcase }
    end

    def self.get_by_id(id)
      all.find { |s| s.id == id }
    end
  end
end
