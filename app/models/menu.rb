class Menu < ApplicationRecord
  belongs_to :user
  has_many :menu_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one_attached :image

  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search_for(content, method)
    if method == 'perfect'
      Menu.where(title: content)
    elsif method == 'forward'
      Menu.where('title LIKE ?', content+'%')
    elsif method == 'backward'
      Menu.where('title LIKE ?', '%'+content)
    else
      Menu.where('title LIKE ?', '%'+content+'%')
    end
  end
end
