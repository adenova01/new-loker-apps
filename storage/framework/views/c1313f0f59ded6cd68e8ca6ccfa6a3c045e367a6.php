<?php $__env->startPush('head-script'); ?>
    <link rel="stylesheet" href="//cdn.datatables.net/fixedheader/3.1.5/css/fixedHeader.bootstrap.min.css">
    <link rel="stylesheet" href="//cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">    <link rel="stylesheet" href="<?php echo e(asset('assets/node_modules/html5-editor/bootstrap-wysihtml5.css')); ?>">
    <link rel="stylesheet" href="<?php echo e(asset('assets/node_modules/bootstrap-datepicker/bootstrap-datepicker.min.css')); ?>">
    <link rel="stylesheet" href="<?php echo e(asset('assets/node_modules/multiselect/css/multi-select.css')); ?>">
    <link rel="stylesheet" href="<?php echo e(asset('assets/plugins/iCheck/all.css')); ?>">

    <style>
        .mb-20{
            margin-bottom: 20px
        }
        .datepicker{
            z-index: 9999 !important;
        }
        .select2-container--default .select2-selection--single, .select2-selection .select2-selection--single {
            width: 250px;
        }
    </style>
<?php $__env->stopPush(); ?>

<?php $__env->startSection('content'); ?>

    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive m-t-40">
                        <table id="myTable" class="table table-bordered table-striped">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th><?php echo app('translator')->get('modules.jobApplication.applicantName'); ?></th>
                                <th><?php echo app('translator')->get('menu.jobs'); ?></th>
                                <th><?php echo app('translator')->get('menu.locations'); ?></th>
                                <th><?php echo app('translator')->get('app.joinDate'); ?></th>
                                <th><?php echo app('translator')->get('app.acceptLastDate'); ?></th>
                                <th><?php echo app('translator')->get('app.status'); ?></th>
                                <th><?php echo app('translator')->get('app.action'); ?></th>
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
    <script src="<?php echo e(asset('assets/node_modules/bootstrap-select/bootstrap-select.min.js')); ?>" type="text/javascript"></script>
    <script src="//cdn.datatables.net/fixedheader/3.1.5/js/dataTables.fixedHeader.min.js"></script>
    <script src="//cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
    <script src="//cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>
    <script src="<?php echo e(asset('assets/node_modules/moment/moment.js')); ?>" type="text/javascript"></script>
    <script src="<?php echo e(asset('assets/node_modules/multiselect/js/jquery.multi-select.js')); ?>"></script>
    <script src="<?php echo e(asset('assets/plugins/iCheck/icheck.min.js')); ?>"></script>
    <script src="<?php echo e(asset('assets/node_modules/bootstrap-datepicker/bootstrap-datepicker.min.js')); ?>" type="text/javascript"></script>

    <script>

        var table;
        tableLoad('load');

        function tableLoad() {
            table = $('#myTable').dataTable({
                responsive: true,
                processing: true,
                serverSide: true,
                destroy: true,
                stateSave: true,
                ajax: '<?php echo route('admin.job-onboard.data'); ?>',
                language: languageOptions(),
                "fnDrawCallback": function (oSettings) {
                    $("body").tooltip({
                        selector: '[data-toggle="tooltip"]'
                    });
                },
                columns: [
                    {data: 'id', name:'id'},
                    {data: 'full_name', name: 'job_applications.full_name', width: '17%'},
                    {data: 'title', name: 'jobs.title', width: '17%'},
                    {data: 'location', name: 'job_locations.location'},
                    {data: 'joining_date', name: 'joining_date'},
                    {data: 'accept_last_date', name: 'accept_last_date'},
                    {data: 'hired_status', name: 'hired_status'},
                    {data: 'action', name: 'action', width: '15%', searchable : false}
                ]
            });
            new $.fn.dataTable.FixedHeader(table);
        }

        $('body').on('click', '.send-offer', function(){
            var id = $(this).data('row-id');
            swal({
                title: "<?php echo app('translator')->get('errors.areYouSure'); ?>",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "<?php echo app('translator')->get('app.send'); ?> <?php echo app('translator')->get('app.offer'); ?>",
                cancelButtonText: "<?php echo app('translator')->get('app.cancel'); ?>",
                closeOnConfirm: true,
                closeOnCancel: true
            }, function(isConfirm){
                if (isConfirm) {

                    var url = "<?php echo e(route('admin.job-onboard.send-offer',':id')); ?>";
                    url = url.replace(':id', id);

                    var token = "<?php echo e(csrf_token()); ?>";

                    $.easyAjax({
                        type: 'GET',
                        url: url,
                        container: '#myTable',
                        success: function (response) {
                            if (response.status == "success") {
                                $.unblockUI();
                                table._fnDraw();
                            }
                        }
                    });
                }
            });
        });

        // Change status in cancel
        $('body').on('click', '.sa-params', function(){
            var id = $(this).data('row-id');
            swal({
                title: "<?php echo app('translator')->get('messages.offer.areYouSureCanceled'); ?>",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "<?php echo app('translator')->get('messages.offer.yesDoIt'); ?> ",
                cancelButtonText: "<?php echo app('translator')->get('app.cancel'); ?>",
                closeOnConfirm: true,
                closeOnCancel: true
            }, function(isConfirm){
                if (isConfirm) {

                    var url = "<?php echo e(route('admin.job-onboard.update-status',':id')); ?>";
                    url = url.replace(':id', id);

                    var token = "<?php echo e(csrf_token()); ?>";

                    $.easyAjax({
                        type: 'GET',
                        url: url,
                        success: function (response) {
                            if (response.status == "success") {
                                $.unblockUI();
                                table._fnDraw();
                            }
                        }
                    });
                }
            });
        });

        table.on('click', '.show-detail', function () {
            $(".right-sidebar").slideDown(50).addClass("shw-rside");

            var id = $(this).data('row-id');
            var url = "<?php echo e(route('admin.job-applications.show',':id')); ?>";
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
<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\loker-apps-new\resources\views/admin/job-onboard/index.blade.php ENDPATH**/ ?>