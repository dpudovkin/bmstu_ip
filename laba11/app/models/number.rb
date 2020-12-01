# frozen_string_literal: true

require 'json'

class Number < ApplicationRecord
  validates :num, presence: true, numericality: { only_integer: true, greater_than: 0 }, uniqueness: true
  validates :result, presence: true

  def values
    JSON.parse(self[:result])
  end

  def values=(data)
    self[:result] = JSON.generate(data)
  end
end
