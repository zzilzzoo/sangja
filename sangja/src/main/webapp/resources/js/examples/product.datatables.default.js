/*
Name: 			Tables / Advanced - Examples
Written by: 	Okler Themes - (http://www.okler.net)
Theme Version: 	4.0.0
*/

(function($) {

	'use strict';

	var datatableInit = function() {
		
		$('#datatable-default').dataTable({
			dom: '<"row"<"col-lg-6"l><"col-lg-6"f>><"table-responsive"t>p',
			language: {
					paginate: {
						previous: '<i class="fas fa-chevron-left"></i>',
						next: '<i class="fas fa-chevron-right"></i>'
				}
			},
			columnDefs: [
				{
					targets: [0,3],
					orderable: false
				}
			],
			order: [],
			language: {
				paginate: {
					previous: '<i class="fas fa-chevron-left"></i>',
					next: '<i class="fas fa-chevron-right"></i>'
				}
			},
			drawCallback: function() {
				
				// Move dataTables info to footer of table
				$('#datatable-default')
					.closest('.dataTables_wrapper')
					.find('.dataTables_info')
					.appendTo( this.closest('.datatables-header-footer-wrapper').find('.results-info-wrapper') );

				// Move dataTables pagination to footer of table
				$('#datatable-default')
					.closest('.dataTables_wrapper')
					.find('.dataTables_paginate')
					.appendTo( this.closest('.datatables-header-footer-wrapper').find('.pagination-wrapper') );
				
				$('#datatable-default').closest('.datatables-header-footer-wrapper').find('.pagination').addClass('pagination-modern pagination-modern-spacing justify-content-center');

			}
		});
		
		// Select All
		$('#datatable-default').find( '.select-all' ).on('change', function(){
			if( this.checked ) {
				$('#datatable-default').find( 'input[type="checkbox"]:not(.select-all)' ).prop('checked', true);
			} else {
				$('#datatable-default').find( 'input[type="checkbox"]:not(.select-all)' ).prop('checked', false);
			}
		});
		
		$('#datatable-default-user').dataTable({
			dom: '<"row"<"col-lg-6"l><"col-lg-6"f>><"table-responsive"t>p',
			language: {
					paginate: {
						previous: '<i class="fas fa-chevron-left"></i>',
						next: '<i class="fas fa-chevron-right"></i>'
				}
			},
			columnDefs: [
				{
					targets: [0,3,4],
					orderable: false
				}
			],
			order: [],
			language: {
				paginate: {
					previous: '<i class="fas fa-chevron-left"></i>',
					next: '<i class="fas fa-chevron-right"></i>'
				}
			},
			drawCallback: function() {
				
				// Move dataTables info to footer of table
				$('#datatable-default-user')
					.closest('.dataTables_wrapper')
					.find('.dataTables_info')
					.appendTo( this.closest('.datatables-header-footer-wrapper').find('.results-info-wrapper') );

				// Move dataTables pagination to footer of table
				$('#datatable-default-user')
					.closest('.dataTables_wrapper')
					.find('.dataTables_paginate')
					.appendTo( this.closest('.datatables-header-footer-wrapper').find('.pagination-wrapper') );
				
				$('#datatable-default-user').closest('.datatables-header-footer-wrapper').find('.pagination').addClass('pagination-modern pagination-modern-spacing justify-content-center');

			}
		});
		
		// Select All
		$('#datatable-default-user').find( '.select-all' ).on('change', function(){
			if( this.checked ) {
				$('#datatable-default-user').find( 'input[type="checkbox"]:not(.select-all)' ).prop('checked', true);
			} else {
				$('#datatable-default-user').find( 'input[type="checkbox"]:not(.select-all)' ).prop('checked', false);
			}
		});

	};
	
	$(function() {
		datatableInit();
	});

}).apply(this, [jQuery]);