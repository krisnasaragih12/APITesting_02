<x-admin-layout>
    @section('title', 'Kritik&Saran')
    <div class="page-header">
        <h1 class="page-title">Kritik & Saran</h1>
        <div>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active" aria-current="page">Kritik & Saran</li>
            </ol>
        </div>
    </div>
    
    <div class="container">
        <ul class="notification">
            <?php
            // Mengurutkan data berdasarkan waktu pembuatan secara menurun
            arsort($saran);
            
            foreach($saran as $item):
            ?>
            <li>
                <div class="notification-time">
                </div>
                <div class="notification-icon">
                    <a href="javascript:void(0);"></a>
                </div>
                <div class="notification-body">
                    <div class="media mt-0">
                        <div class="media-body ms-3 d-flex">
                            <div class="">
                                <p class="fs-15 text-dark fw-bold mb-0">{{ $item['nama'] }}</p>
                                <p class="mb-0 fs-13 text-dark">{{ $item['saran'] }}</p>
                            </div>
                            <div class="notify-time">
                                <p class="mb-0 text-muted fs-11">{{ $item['CreatedAt'] }}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </li>
            <?php
            endforeach;
            ?>
        </ul>
    </div>
</x-admin-layout>
