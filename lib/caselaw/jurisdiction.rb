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
        Jurisdiction.new("Alabama", 23, "ala"),
        Jurisdiction.new("Alaska", 53, "alaska"),
        Jurisdiction.new("American Samoa", 58, "am-samoa"),
        Jurisdiction.new("Arizona", 21, "ariz"),
        Jurisdiction.new("Arkansas", 34, "ark"),
        Jurisdiction.new("California", 30, "cal"),
        Jurisdiction.new("Colorado", 31, "colo"),
        Jurisdiction.new("Connecticut", 2, "conn"),
        Jurisdiction.new("Dakota Territory", 55, "dakota-territory"),
        Jurisdiction.new("District of Columbia", 56, "dc"),
        Jurisdiction.new("Delaware", 8, "del"),
        Jurisdiction.new("Florida", 28, "fla"),
        Jurisdiction.new("Georgia", 3, "ga"),
        Jurisdiction.new("Guam", 60, "guam"),
        Jurisdiction.new("Hawaii", 40, "haw"),
        Jurisdiction.new("Idaho", 27, "idaho"),
        Jurisdiction.new("Illinois", 29, "ill"),
        Jurisdiction.new("Indiana", 14, "ind"),
        Jurisdiction.new("Iowa", 45, "iowa"),
        Jurisdiction.new("Kansas", 43, "kan"),
        Jurisdiction.new("Kentucky", 26, "ky"),
        Jurisdiction.new("Louisiana", 10, "la"),
        Jurisdiction.new("Massachusetts", 4, "mass"),
        Jurisdiction.new("Maryland", 50, "md"),
        Jurisdiction.new("Maine", 42, "me"),
        Jurisdiction.new("Michigan", 49, "mich"),
        Jurisdiction.new("Minnesota", 36, "minn"),
        Jurisdiction.new("Mississippi", 16, "miss"),
        Jurisdiction.new("Missouri", 37, "mo"),
        Jurisdiction.new("Montana", 20, "mont"),
        Jurisdiction.new("Native American", 61, "native-american"),
        Jurisdiction.new("Navajo Nation", 41, "navajo-nation"),
        Jurisdiction.new("North Carolina", 5, "nc"),
        Jurisdiction.new("North Dakota", 18, "nd"),
        Jurisdiction.new("Nebraska", 51, "neb"),
        Jurisdiction.new("Nevada", 48, "nev"),
        Jurisdiction.new("New Hampshire", 47, "nh"),
        Jurisdiction.new("New Jersey", 24, "nj"),
        Jurisdiction.new("New Mexico", 52, "nm"),
        Jurisdiction.new("Northern Mariana Islands", 57, "n-mar-i"),
        Jurisdiction.new("New York", 1, "ny"),
        Jurisdiction.new("Ohio", 22, "ohio"),
        Jurisdiction.new("Oklahoma", 13, "okla"),
        Jurisdiction.new("Oregon", 19, "or"),
        Jurisdiction.new("Pennsylvania", 6, "pa"),
        Jurisdiction.new("Puerto Rico", 25, "pr"),
        Jurisdiction.new("Regional", 9, "regional"),
        Jurisdiction.new("Rhode Island", 15, "ri"),
        Jurisdiction.new("South Carolina", 59, "sc"),
        Jurisdiction.new("South Dakota", 54, "sd"),
        Jurisdiction.new("Tennessee", 11, "tenn"),
        Jurisdiction.new("Texas", 32, "tex"),
        Jurisdiction.new("Tribal Jurisdictions", 62, "tribal"),
        Jurisdiction.new("United States", 39, "us"),
        Jurisdiction.new("Utah", 12, "utah"),
        Jurisdiction.new("Virginia", 7, "va"),
        Jurisdiction.new("Virgin Islands", 44, "vi"),
        Jurisdiction.new("Vermont", 17, "vt"),
        Jurisdiction.new("Washington", 38, "wash"),
        Jurisdiction.new("Wisconsin", 46, "wis"),
        Jurisdiction.new("West Virginia", 35, "w-va"),
        Jurisdiction.new("Wyoming", 33, "wyo")
      ]
    end

    def self.get_by_name(name)
      jurisdiction = all.find { |s| s.name.downcase == name.downcase }
      slug = jurisdiction.slug
      slug
    end

    def self.get_by_id(id)
      jurisdiction = all.find { |s| s.id == id }
      slug = jurisdiction.slug
      slug
    end
  end
end
