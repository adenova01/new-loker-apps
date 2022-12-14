<?php $__env->startPush('head-script'); ?>
    <link rel="stylesheet" href="//cdn.datatables.net/fixedheader/3.1.5/css/fixedHeader.bootstrap.min.css">
    <link rel="stylesheet" href="//cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
<?php $__env->stopPush(); ?>

<?php $__env->startSection('content'); ?>

    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <div class="row clearfix">
                        <div class="col-md-12 mb-4 d-flex justify-content-between">
                            <div id="search-container" class="d-flex w-50">
                                <input id="skill" class="form-control mr-2" type="text" name="skill" placeholder="<?php echo app('translator')->get('modules.applicationArchive.enterSkill'); ?>">
                                <a href="javascript:;" class="d-none">
                                    <i class="fa fa-times-circle-o"></i>
                                </a>                
                            </div>

                            <a class="pull-right" onclick="exportJobApplication()" >
                                <button class="btn btn-sm btn-primary" type="button">
                                    <i class="fa fa-upload"></i>  <?php echo app('translator')->get('menu.export'); ?>
                                </button>
                            </a>
                        </div>
                    </div>
                    <div class="table-responsive m-t-40">
                        <table id="myTable" class="table table-bordered table-striped ">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th><?php echo app('translator')->get('modules.jobApplication.applicantName'); ?></th>
                                <th><?php echo app('translator')->get('menu.jobs'); ?></th>
                                <th><?php echo app('translator')->get('menu.locations'); ?></th>
                            </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('footer-script'); ?>
    <script src="<?php echo e(asset('assets/node_modules/select2/dist/js/select2.full.min.js')); ?>" type="text/javascript"></script>
    <script src="//cdn.datatables.net/fixedheader/3.1.5/js/dataTables.fixedHeader.min.js"></script>
    <script src="//cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
    <script src="//cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>

    <script>
        var table;
        loadTable();

        function redrawTable() {
            table._fnDraw();
        }

        function loadTable() {
            table = $('#myTable').dataTable({
                responsive: true,
                // processing: true,
                serverSide: true,
                destroy: true,
                ajax: {
                    url: "<?php echo route('admin.applications-archive.data'); ?>",
                    data: function ( d ) {
                        return $.extend( {}, d, {
                            skill: $('#skill').val()
                        } );
                    }
                },
                language: languageOptions(),
                "fnDrawCallback": function( oSettings ) {
                    $("body").tooltip({
                        selector: '[data-toggle="tooltip"]'
                    });
                },
                columns: [
                    { data: 'DT_Row_Index'},
                    { data: 'full_name', name: 'full_name' },
                    { data: 'title', name: 'title', width: '17%'},
                    { data: 'location', name: 'location'},
                ]
            });
            new $.fn.dataTable.FixedHeader( table );
        }

        function exportJobApplication(){
            var skillVal = $('#skill').val();

            if (skillVal == '') {
                skillVal = undefined
            }

            var url = '<?php echo e(route('admin.applications-archive.export', ':skill')); ?>';
            url = url.replace(':skill', skillVal);

            window.location.href = url;
        }

        search($('#skill'), 500, 'table');

        table.on('click', '.show-detail', function () {
            $(".right-sidebar").slideDown(50).addClass("shw-rside");

            var id = $(this).data('row-id');
            var url = "<?php echo e(route('admin.applications-archive.show',':id')); ?>";
            url = url.replace(':id', id);

            $.easyAjax({
                type: 'GET',
                url: url,
                success: function (response) {
                    if (response.status == "success") {
                        $('#right-sidebar-content').html(response.view);
                    }
                }
            });
        });
    </script>
<?php $__env->stopPush(); ?>
<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\loker-apps-new\resources\views/admin/applications-archive/index.blade.php ENDPATH**/ ?>