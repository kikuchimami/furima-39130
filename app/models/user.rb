class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :family_name_zenkaku, presence: true
  validates :last_name_zenkaku, presence: true
  validates :kana_family_name_zenkaku, presence: true
  validates :kana_last_name_zenkaku, presence: true
  validates :birthday, presence: true

  with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: '全角文字を使用してください' } do
    validates :kana_family_name_zenkaku
    validates :kana_last_name_zenkaku
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :family_name_zenkaku
    validates :last_name_zenkaku
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX 

  has_many :items
  has_many :orders
end
