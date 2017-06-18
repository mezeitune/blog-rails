class Article < ApplicationRecord
	include AASM #Para que funcione la gema de maquina de estados

	#La tabla => articles
	#Campos => article.title() => 'El titulo del articulo'
	#Escribir metodos
	belongs_to :user#asociasion 1 a muchos , tambien esta asociado en el modelo user
	has_many :comments
	has_many :categories, through: :has_categories
	has_many :has_categories


	validates :title , presence: true, uniqueness: true
	validates :body , presence: true , length: {minimum: 20}
	before_save :set_visits_count#antes de guardar poneme las visitas en 0
	after_create :save_categories

	has_attached_file :cover, styles: { medium: "1280x720", thumb: "800x600"}
	validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/


	#scope :publicados, ->{ where(state: "published") }

	def self.publicados #los scopes son statics
		Article.where(state:"published")
	end

	scope :ultimos, ->{ order("created_at DESC")}

	#Custom setter
	def categories=(value)
		@categories=value
	end

	def update_visits_count
		#self.save if self.visits_count.nil?
		self.update(visits_count: self.visits_count + 1)
	end

	aasm column: "state" do
		state :in_draft, initial: true
		state :published

		event :publish do
			transitions from: :in_draft, to: :published
		end

		event :unpublish do
			transitions from: :published, to: :in_draft
		end
	end

	private

	def save_categories
		if @categories
			@categories.each do |category_id|
				HasCategory.create(category_id: category_id,article_id: self.id)
			end
		end
	end

	def set_visits_count
		self.visits_count ||= 0
	end
end
