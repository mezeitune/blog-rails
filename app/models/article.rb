class Article < ApplicationRecord
	#La tabla => articles
	#Campos => article.title() => 'El titulo del articulo'
	#Escribir metodos
	belongs_to :user#asociasion 1 a muchos , tambien esta asociado en el modelo user
	has_many :comments
	validates :title , presence: true, uniqueness: true
	validates :body , presence: true , length: {minimum: 20}
	before_save :set_visits_count#antes de guardar poneme las visitas en 0

	def update_visits_count
		#self.save if self.visits_count.nil?
		self.update(visits_count: self.visits_count + 1)
	end

	private

	def set_visits_count
		self.visits_count ||= 0
	end
end
