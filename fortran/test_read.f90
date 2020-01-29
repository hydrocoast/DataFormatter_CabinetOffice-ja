program main
    implicit none
    !character(*) :: filename
    integer :: nx,ny
    real*8, allocatable :: data(:,:)

    nx = 720
    ny = 540
    allocate(data(ny,nx))

    call formatter('../depth/system08/depth_2430-01.dat', nx, ny, data)
    call write_matrix('matrix_depth_2430-01.csv', nx, ny, -data)

end program main
