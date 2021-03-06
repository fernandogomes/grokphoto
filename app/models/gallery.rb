class Gallery < ActiveRecord::Base

  # ****
  # Pagination
  paginates_per 16

  # ****
  # Associations
  has_many :gallery_photos, :dependent => :destroy

  # Multi-file uploads
  def gallery_photos_attrs=(attrs)
    attrs.each { |attr| self.gallery_photos.build(:photo => attr) }
  end

  # ****
  # Validations
  validates :title, :presence => true, :length => { :within => 2..100 }
  validates :description, :length => { :within => 5..2000, :allow_blank => true }

  # ****
  # Mass-assignment protection
  attr_accessible :title, :description, :expires_on, :gallery_photos_attrs

  # ****
  # Named scopes
  scope :active, where("expires_on >= ?", Time.now)
  scope :expired, where("expires_on < ?", Time.now)

  # Determine if the gallery has expired.
  def expired?
    (self.expires_on and self.expires_on < Date.today) || false
  end

  # Secures galleries by using an unguessable token.
  before_create :build_token

  private #----

    def build_token
      self.token = Devise.friendly_token
    end

end