class AddPublishedAtToJobOffers < ActiveRecord::Migration[5.2]
  def change
    add_column :job_offers, :published_at, :datetime

    JobOffer.where(state: :published).all.each do |job_offer|
      target_audit = job_offer.audits.reorder(version: :desc).where("audited_changes->'state'->1 = ?", :published.to_json).first
      if target_audit
        job_offer.update_column :published_at, target_audit.created_at
      end
    end
  end
end
