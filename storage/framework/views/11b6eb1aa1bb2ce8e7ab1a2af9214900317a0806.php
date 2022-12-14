<?php $__env->startPush('head-script'); ?>
    <link rel="stylesheet" href="<?php echo e(asset('assets/plugins/calendar/dist/fullcalendar.css')); ?>">
    <link rel="stylesheet" href="//cdn.datatables.net/fixedheader/3.1.5/css/fixedHeader.bootstrap.min.css">
    <link rel="stylesheet" href="//cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
    <link rel="stylesheet"
          href="<?php echo e(asset('assets/node_modules/bootstrap-material-datetimepicker/css/bootstrap-material-datetimepicker.css')); ?>">

    <style>
        .mb-20 {
            margin-bottom: 20px
        }

        .datepicker {
            z-index: 9999 !important;
        }

        .select2-container--default .select2-selection--single, .select2-selection .select2-selection--single {
            width: 100%;
        }

        .select2-search {
            width: 100%;
        }

        .select2.select2-container {
            width: 100% !important;
        }

        .select2-search__field {
            width: 100% !important;
            display: block;
            padding: .375rem .75rem !important;
            font-size: 1rem;
            line-height: 1.5;
            color: #495057;
            background-color: #fff;
            background-clip: padding-box;
            border: 1px solid #ced4da;
            transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
        }

        .d-block {
            display: block;
        }

        .upcomingdata {
            height: 37.5rem;
            overflow-x: scroll;
        }

        .notify-button {
            /*height: 1.5em;*/
            font-size: 0.730rem !important;
            line-height: 0.5 !important;
        }

        .scheduleul {
            padding: 0 15px 0 11px;
        }
    </style>
<?php $__env->stopPush(); ?>

<?php $__env->startSection('content'); ?>
    <div class="row">
        <div class="col-md-12 mb-2">
                <?php if (\Entrust::can('view_schedule')) : ?>
                <a href="<?php echo e(route('admin.interview-schedule.table-view')); ?>"
                   class="btn btn-sm btn-primary"><?php echo app('translator')->get('app.tableView'); ?> <i class="fa fa-table"></i></a>
                <?php endif; // Entrust::can ?>
                <?php if (\Entrust::can('add_schedule')) : ?>
                <a href="#" data-toggle="modal" onclick="createSchedule()"
                   class="btn btn-sm btn-success waves-effect waves-light">
                    <i class="ti-plus"></i> <?php echo app('translator')->get('modules.interviewSchedule.addInterviewSchedule'); ?>
                </a>
                <?php endif; // Entrust::can ?>
        </div>
    </div>
    <div class="row">

        <div class="col-md-8">
            <div class="card">
                <div class="card-body">
                    <div id="calendar"></div>
                </div><!-- /.card-body -->
            </div>

        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-header d-flex p-0 ui-sortable-handle">
                    <h3 class="card-title p-3">
                        <i class="fa fa-file"></i> <?php echo app('translator')->get('modules.interviewSchedule.interviewSchedule'); ?>
                    </h3>
                </div><!-- /.card-header -->
                <div id="upcoming-schedules" class="card-body">
                    <?php echo $__env->make('admin.interview-schedule.upcoming-schedule', ['upComingSchedules' => $upComingSchedules], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                </div><!-- /.card-body -->
            </div>
        </div>

    </div>

    
    <div class="modal fade bs-modal-md in" id="scheduleDetailModal" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-lg" id="modal-data-application">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                    <span class="caption-subject font-red-sunglo bold uppercase" id="modelHeading"></span>
                </div>
                <div class="modal-body">
                    Loading...
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn blue">Save changes</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    

    
    <div class="modal fade bs-modal-md in" id="scheduleEditModal" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-lg" id="modal-data-application">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                    <span class="caption-subject font-red-sunglo bold uppercase" id="modelHeading"></span>
                </div>
                <div class="modal-body">
                    Loading...
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn blue">Save changes</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    
<?php $__env->stopSection(); ?>

<?php $__env->startPush('footer-script'); ?>
    <script src="<?php echo e(asset('assets/node_modules/select2/dist/js/select2.full.min.js')); ?>"
            type="text/javascript"></script>
    <script src="<?php echo e(asset('assets/node_modules/bootstrap-select/bootstrap-select.min.js')); ?>"
            type="text/javascript"></script>
    <script src="//cdn.datatables.net/fixedheader/3.1.5/js/dataTables.fixedHeader.min.js"></script>
    <script src="//cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
    <script src="//cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>
    <script src="<?php echo e(asset('assets/node_modules/moment/moment.js')); ?>" type="text/javascript"></script>

    <script src="<?php echo e(asset('assets/plugins/calendar/dist/fullcalendar.min.js')); ?>"></script>
    <script src="<?php echo e(asset('assets/plugins/calendar/dist/jquery.fullcalendar.js')); ?>"></script>
    <script src="<?php echo e(asset('assets/plugins/calendar/dist/locale-all.js')); ?>"></script>

    <script>
        userCanAdd = false;
        userCanEdit = false;
        <?php if($user->can('add_schedule')): ?>
            userCanAdd = true;
        <?php endif; ?>
        <?php if($user->can('edit_schedule')): ?>
            userCanEdit = true;
        <?php endif; ?>
        taskEvents = [
                <?php $__currentLoopData = $schedules; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $schedule): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            {
                id: '<?php echo e(ucfirst($schedule->id)); ?>',
                title: '<?php echo e($schedule->jobApplication->job->title); ?> on <?php echo e($schedule->jobApplication->full_name); ?>',
                start: '<?php echo e($schedule->schedule_date); ?>',
                end: '<?php echo e($schedule->schedule_date); ?>',
            },
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        ];
        var scheduleLocale = '<?php echo e($global->locale); ?>';
    </script>
    <script src="<?php echo e(asset('js/schedule-calendar.js')); ?>"></script>

    <script>
        // Schedule create modal view

        <?php if($user->can('edit_schedule')): ?>
        // Schedule create modal view
        function editUpcomingSchedule(event, id) {
            if (!$(event.target).closest('.editSchedule').length) {
                return false;
            }
            var url = "<?php echo e(route('admin.interview-schedule.edit',':id')); ?>";
            url = url.replace(':id', id);
            $('#modelHeading').html('Schedule');
            $('#scheduleEditModal').modal('hide');
            $.ajaxModal('#scheduleEditModal', url);
        }
        <?php endif; ?>

        // Update Schedule
        function reloadSchedule() {
            $.easyAjax({
                url: '<?php echo e(route('admin.interview-schedule.index')); ?>',
                container: '#updateSchedule',
                type: "GET",
                success: function (response) {
                    $('#upcoming-schedules').html(response.data);

                    taskEvents = [];
                    response.scheduleData.forEach(function(schedule){
                        const taskEvent = {
                            id: schedule.id,
                            title: schedule.job_application.job.title +' on '+  schedule.job_application.full_name ,
                            start: schedule.schedule_date ,
                            end: schedule.schedule_date,
                        };
                        taskEvents.push(taskEvent);
                    });

                    $.CalendarApp.reInit();
                }
            })
        }
        <?php if($user->can('delete_schedule')): ?>
        $('body').on('click', '.deleteSchedule', function (event) {
            var id = $(this).data('schedule-id');
            if (!$(event.target).closest('.deleteSchedule').length) {
                return false;
            }
            swal({
                title: "<?php echo app('translator')->get('errors.areYouSure'); ?>",
                text: "<?php echo app('translator')->get('errors.deleteWarning'); ?>",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "<?php echo app('translator')->get('app.delete'); ?>",
                cancelButtonText: "<?php echo app('translator')->get('app.cancel'); ?>",
                closeOnConfirm: true,
                closeOnCancel: true
            }, function (isConfirm) {
                if (isConfirm) {

                    var url = "<?php echo e(route('admin.interview-schedule.destroy',':id')); ?>";
                    url = url.replace(':id', id);

                    var token = "<?php echo e(csrf_token()); ?>";

                    $.easyAjax({
                        type: 'POST',
                        url: url,
                        data: {'_token': token, '_method': 'DELETE'},
                        success: function (response) {
                            if (response.status == "success") {
                                $.unblockUI();
                                $('#schedule-'+id).remove();
                                // Schedule create modal view
                                reloadSchedule();
                            }
                        }
                    });
                }
            });
        });
        <?php endif; ?>
        // Employee Response on schedule
        function employeeResponse(id, type) {
            var msg;

            if (type == 'accept') {
                msg = "<?php echo app('translator')->get('errors.acceptSchedule'); ?>";
            } else {
                msg = "<?php echo app('translator')->get('errors.refuseSchedule'); ?>";
            }
            swal({
                title: "<?php echo app('translator')->get('errors.areYouSure'); ?>",
                text: msg,
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "<?php echo app('translator')->get('app.yes'); ?>",
                cancelButtonText: "<?php echo app('translator')->get('app.cancel'); ?>",
                closeOnConfirm: true,
                closeOnCancel: true
            }, function (isConfirm) {
                if (isConfirm) {
                    var url = "<?php echo e(route('admin.interview-schedule.response',[':id',':type'])); ?>";
                    url = url.replace(':id', id);
                    url = url.replace(':type', type);

                    // update values for all tasks
                    $.easyAjax({
                        url: url,
                        type: 'GET',
                        success: function (response) {
                            if (response.status == 'success') {
                                window.location.reload();
                            }
                        }
                    });
                }
            });
        }

        // schedule detail
        var getScheduleDetail = function (event, id) {

            if ($(event.target).closest('.editSchedule, .deleteSchedule, .responseButton').length) {
                return false;
            }

            var url = '<?php echo e(route('admin.interview-schedule.show', ':id')); ?>';
            url = url.replace(':id', id);

            $('#modelHeading').html('Schedule');
            $.ajaxModal('#scheduleDetailModal', url);
        }
        <?php if($user->can('add_schedule')): ?>

        // Schedule create modal view
        function createSchedule(scheduleDate) {
            if (typeof scheduleDate === "undefined") {
                scheduleDate = '';
            }
            var url = '<?php echo e(route('admin.interview-schedule.create')); ?>?date=' + scheduleDate;
            $('#modelHeading').html('Schedule');
            $.ajaxModal('#scheduleDetailModal', url);
        }
        <?php endif; ?>

        <?php if($user->can('add_schedule')): ?>
            function addScheduleModal(start, end, allDay) {
            var scheduleDate;
            if (start) {
                var sd = new Date(start);
                var curr_date = sd.getDate();
                if (curr_date < 10) {
                    curr_date = '0' + curr_date;
                }
                var curr_month = sd.getMonth();
                curr_month = curr_month + 1;
                if (curr_month < 10) {
                    curr_month = '0' + curr_month;
                }
                var curr_year = sd.getFullYear();
                scheduleDate = curr_year + '-' + curr_month + '-' + curr_date;
            }

            createSchedule(scheduleDate);
        }
        <?php endif; ?>
    </script>
<?php $__env->stopPush(); ?>
<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\loker-apps-new\resources\views/admin/interview-schedule/index.blade.php ENDPATH**/ ?>