<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary">
    <!-- Brand Logo -->
    <a href="<?php echo e(route('admin.dashboard')); ?>" class="brand-link">
        <img src="<?php echo e($global->logo_url); ?>"
             alt="AdminLTE Logo"
             class="brand-image img-fluid">
    </a>

    <!-- Sidebar -->
    <div class="sidebar">

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" id="sidebarnav" role="menu" data-accordion="false">
                <!-- Add icons to the links using the .nav-icon class
                     with font-awesome or any other icon font library -->
                <li class="nav-item">
                    <a href="<?php echo e(route('admin.dashboard')); ?>" class="nav-link <?php echo e(request()->is('admin/dashboard*') ? 'active' : ''); ?>">
                        <i class="nav-icon icon-speedometer"></i>
                        <p>
                            <?php echo app('translator')->get('menu.dashboard'); ?>
                        </p>
                    </a>
                </li>

                <?php if (\Entrust::can('view_category')) : ?>
                <li class="nav-item">
                    <a href="<?php echo e(route('admin.job-categories.index')); ?>" class="nav-link <?php echo e(request()->is('admin/job-categories*') ? 'active' : ''); ?>">
                        <i class="nav-icon icon-grid"></i>
                        <p>
                            <?php echo app('translator')->get('menu.jobCategories'); ?>
                        </p>
                    </a>
                </li>
                <?php endif; // Entrust::can ?>

                <?php if (\Entrust::can('view_skills')) : ?>
                <li class="nav-item">
                    <a href="<?php echo e(route('admin.skills.index')); ?>" class="nav-link <?php echo e(request()->is('admin/skills*') ? 'active' : ''); ?>">
                        <i class="nav-icon icon-grid"></i>
                        <p>
                            <?php echo app('translator')->get('menu.skills'); ?>
                        </p>
                    </a>
                </li>
                <?php endif; // Entrust::can ?>

                <?php if (\Entrust::can('view_company')) : ?>
                <li class="nav-item">
                    <a href="<?php echo e(route('admin.company.index')); ?>" class="nav-link <?php echo e(request()->is('admin/company*') ? 'active' : ''); ?>">
                        <i class="nav-icon icon-film"></i>
                        <p>
                            <?php echo app('translator')->get('menu.companies'); ?>
                        </p>
                    </a>
                </li>
                <?php endif; // Entrust::can ?>

                <?php if (\Entrust::can('view_locations')) : ?>
                <li class="nav-item">
                    <a href="<?php echo e(route('admin.locations.index')); ?>" class="nav-link <?php echo e(request()->is('admin/locations*') ? 'active' : ''); ?>">
                        <i class="nav-icon icon-location-pin"></i>
                        <p>
                            <?php echo app('translator')->get('menu.locations'); ?>
                        </p>
                    </a>
                </li>
                <?php endif; // Entrust::can ?>

                <?php if (\Entrust::can('view_jobs')) : ?>
                <li class="nav-item">
                    <a href="<?php echo e(route('admin.jobs.index')); ?>" class="nav-link <?php echo e(request()->is('admin/jobs*') ? 'active' : ''); ?>">
                        <i class="nav-icon icon-badge"></i>
                        <p>
                            <?php echo app('translator')->get('menu.jobs'); ?>
                        </p>
                    </a>
                </li>
                <?php endif; // Entrust::can ?>

                <?php if (\Entrust::can('view_job_applications')) : ?>
                <li class="nav-item">
                    <a href="<?php echo e(route('admin.job-applications.index')); ?>" class="nav-link <?php echo e(request()->is('admin/job-applications*') ? 'active' : ''); ?>">
                        <i class="nav-icon icon-user"></i>
                        <p>
                            <?php echo app('translator')->get('menu.jobApplications'); ?>
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="<?php echo e(route('admin.applications-archive.index')); ?>" class="nav-link <?php echo e(request()->is('admin/applications-archive*') ? 'active' : ''); ?>">
                        <i class="nav-icon icon-drawer"></i>
                        <p>
                            <?php echo app('translator')->get('menu.candidateDatabase'); ?>
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="<?php echo e(route('admin.job-onboard.index')); ?>" class="nav-link <?php echo e(request()->is('admin/job-onboard*') ? 'active' : ''); ?>">
                        <i class="nav-icon icon-user"></i>
                        <p>
                            <?php echo app('translator')->get('app.job'); ?> <?php echo app('translator')->get('app.onBoard'); ?>
                        </p>
                    </a>
                </li>
                <?php endif; // Entrust::can ?>

                <?php if (\Entrust::can('view_schedule')) : ?>
                <li class="nav-item">
                    <a href="<?php echo e(route('admin.interview-schedule.index')); ?>" class="nav-link <?php echo e(request()->is('admin/interview-schedule*') ? 'active' : ''); ?>">
                        <i class="nav-icon icon-calendar"></i>
                        <p>
                            <?php echo app('translator')->get('menu.interviewSchedule'); ?>
                        </p>
                    </a>
                </li>
                <?php endif; // Entrust::can ?>

                <?php if (\Entrust::can('view_team')) : ?>
                <li class="nav-item">
                    <a href="<?php echo e(route('admin.team.index')); ?>" class="nav-link <?php echo e(request()->is('admin/team*') ? 'active' : ''); ?>">
                        <i class="nav-icon icon-people"></i>
                        <p>
                            <?php echo app('translator')->get('menu.team'); ?>
                        </p>
                    </a>
                </li>
                <?php endif; // Entrust::can ?>

                <?php if($user->roles->count() > 0): ?>
                    <li class="nav-item">
                        <a href="<?php echo e(route('admin.todo-items.index')); ?>" class="nav-link <?php echo e(request()->is('admin/todo-items*') ? 'active' : ''); ?>">
                            <i class="nav-icon icon-notebook"></i>
                            <p>
                                <?php echo app('translator')->get('menu.todoList'); ?>
                            </p>
                        </a>
                    </li>
                <?php endif; ?>

                <li class="nav-item has-treeview <?php if(\Request()->is('admin/settings/*') || \Request()->is('admin/profile')): ?>active menu-open <?php endif; ?>">
                    <a href="#" class="nav-link">
                        <i class="nav-icon icon-settings"></i>
                        <p>
                            <?php echo app('translator')->get('menu.settings'); ?>
                            <i class="right fa fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="<?php echo e(route('admin.profile.index')); ?>" class="nav-link <?php echo e(request()->is('admin/profile*') ? 'active' : ''); ?>">
                                <i class="fa fa-circle-o nav-icon"></i>
                                <p> <?php echo app('translator')->get('menu.myProfile'); ?></p>
                            </a>
                        </li>
                        <?php if (\Entrust::can('manage_settings')) : ?>
                        <li class="nav-item">
                            <a href="<?php echo e(route('admin.settings.index')); ?>" class="nav-link <?php echo e(request()->is('admin/settings/settings') ? 'active' : ''); ?>">
                                <i class="fa fa-circle-o nav-icon"></i>
                                <p><?php echo app('translator')->get('menu.businessSettings'); ?></p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<?php echo e(route('admin.application-setting.index')); ?>" class="nav-link <?php echo e(request()->is('admin/settings/application-setting') ? 'active' : ''); ?>">
                                <i class="fa fa-circle-o nav-icon"></i>
                                <p><?php echo app('translator')->get('menu.applicationFormSettings'); ?></p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<?php echo e(route('admin.role-permission.index')); ?>" class="nav-link <?php echo e(request()->is('admin/settings/role-permission') ? 'active' : ''); ?>">
                                <i class="fa fa-circle-o nav-icon"></i>
                                <p><?php echo app('translator')->get('menu.rolesPermission'); ?></p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<?php echo e(route('admin.language-settings.index')); ?>" class="nav-link <?php echo e(request()->is('admin/settings/language-settings') ? 'active' : ''); ?>">
                                <i class="fa fa-circle-o nav-icon"></i>
                                <p><?php echo app('translator')->get('app.language'); ?> <?php echo app('translator')->get('menu.settings'); ?></p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<?php echo e(route('admin.footer-settings.index')); ?>" class="nav-link <?php echo e(request()->is('admin/settings/footer-settings') ? 'active' : ''); ?>">
                                <i class="fa fa-circle-o nav-icon"></i>
                                <p><?php echo app('translator')->get('menu.footerSettings'); ?></p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<?php echo e(route('admin.theme-settings.index')); ?>" class="nav-link <?php echo e(request()->is('admin/settings/theme-settings') ? 'active' : ''); ?>">
                                <i class="fa fa-circle-o nav-icon"></i>
                                <p><?php echo app('translator')->get('menu.themeSettings'); ?></p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<?php echo e(route('admin.smtp-settings.index')); ?>" class="nav-link <?php echo e(request()->is('admin/settings/smtp-settings') ? 'active' : ''); ?>">
                                <i class="fa fa-circle-o nav-icon"></i>
                                <p><?php echo app('translator')->get('menu.mailSetting'); ?></p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<?php echo e(route('admin.sms-settings.index')); ?>" class="nav-link <?php echo e(request()->is('admin/settings/sms-settings') ? 'active' : ''); ?>">
                                <i class="fa fa-circle-o nav-icon"></i>
                                <p><?php echo app('translator')->get('menu.smsSettings'); ?></p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<?php echo e(route('admin.linkedin-settings.index')); ?>" class="nav-link">
                                <i class="fa fa-circle-o nav-icon"></i>
                                <p><?php echo app('translator')->get('menu.linkedInSettings'); ?></p>
                            </a>
                        </li>
                        <?php if($global->system_update == 1): ?>
                        <li class="nav-item">
                            <a href="<?php echo e(route('admin.update-application.index')); ?>" class="nav-link <?php echo e(request()->is('admin/settings/update-application') ? 'active' : ''); ?>">
                                <i class="fa fa-circle-o nav-icon"></i>
                                <p><?php echo app('translator')->get('menu.updateApplication'); ?></p>
                            </a>
                        </li>
                        <?php endif; ?>
                        <li class="nav-item">
                            <a href="https://mycoding.net" class="nav-link" target="_blank">
                                <i class="fa fa-circle-o nav-icon"></i>
                                <p><?php echo app('translator')->get('menu.help'); ?></p>
                            </a>
                        </li>
                        <?php endif; // Entrust::can ?>

                    </ul>
                </li>

                <li class="nav-header">MISCELLANEOUS</li>
                <li class="nav-item">
                    <a href="<?php echo e(url('/')); ?>" target="_blank" class="nav-link">
                        <i class="nav-icon fa fa-external-link"></i>
                        <p>Front Website</p>
                    </a>
                </li>

            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside><?php /**PATH C:\laragon\www\loker-apps-new\resources\views/sections/left-sidebar.blade.php ENDPATH**/ ?>