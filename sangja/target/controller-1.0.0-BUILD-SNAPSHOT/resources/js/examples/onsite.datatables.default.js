/*
Name: 			Tables / Advanced - Examples
Written by: 	Okler Themes - (http://www.okler.net)
Theme Version: 	4.0.0
*/
(function($) {

	'use strict';

	var datatableInit = function() {
		
		// Search 
		$('#search-default').dataTable({
			dom: '<"row"<"col-lg-6"l><"col-lg-6"f>><"table-responsive"t>p',
			columnDefs: [
				{
					targets: [0],
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
				$('#search-default')
					.closest('.dataTables_wrapper')
					.find('.dataTables_info')
					.appendTo( this.closest('.datatables-header-footer-wrapper').find('.results-info-wrapper') );

				// Move dataTables pagination to footer of table
				$('#search-default')
					.closest('.dataTables_wrapper')
					.find('.dataTables_paginate')
					.appendTo( this.closest('.datatables-header-footer-wrapper').find('.pagination-wrapper') );
				
				$('#search-default').closest('.datatables-header-footer-wrapper').find('.pagination').addClass('pagination-modern pagination-modern-spacing justify-content-center');

			}
		});

		// add Product
		$('#onsite-default').dataTable({
			dom: '<"row"<"col-lg-6"l><"col-lg-6"f>><"table-responsive"t>p',
			columnDefs: [
				{
					targets: [0],
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
				$('#onsite-default')
					.closest('.dataTables_wrapper')
					.find('.dataTables_info')
					.appendTo( this.closest('.datatables-header-footer-wrapper').find('.results-info-wrapper') );

				// Move dataTables pagination to footer of table
				$('#onsite-default')
					.closest('.dataTables_wrapper')
					.find('.dataTables_paginate')
					.appendTo( this.closest('.datatables-header-footer-wrapper').find('.pagination-wrapper') );
				
				$('#onsite-default').closest('.datatables-header-footer-wrapper').find('.pagination').addClass('pagination-modern pagination-modern-spacing justify-content-center');

			}
		});
		
		// Select All
		$('#onsite-default').find( '.select-all' ).on('change', function(){
			if( this.checked ) {
				$('#onsite-default').find( 'input[type="checkbox"]:not(.select-all)' ).prop('checked', true);
			} else {
				$('#onsite-default').find( 'input[type="checkbox"]:not(.select-all)' ).prop('checked', false);
			}
		});
				
	};

	$(function() {
		datatableInit();
	});

}).apply(this, [jQuery]);