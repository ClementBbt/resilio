class ResiliationsController < ApplicationController
    def index
        @resiliations = scope
    end

    def show
        @resiliation = scope.find(params[:id])

        respond_to do |format|
            format.html
            format.pdf do
                render pdf: "Résilation No. #{@subscription.id}",
                page_size: 'A4',
                template: "invoices/show.html.erb",
                layout: "pdf.html",
                orientation: "Landscape",
                lowquality: true,
                zoom: 1,
                dpi: 75
            end
        end
    end

    private
        def scope
            ::Resiliation.all.includes(:invoice_items)
        end
end
end
