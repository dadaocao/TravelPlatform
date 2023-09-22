package com.info5100.travel.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.info5100.travel.bean.PermissionWithStatus;
import com.info5100.travel.mapper.RoleMapper;
import com.info5100.travel.pojo.Role;
import com.info5100.travel.bean.PermissionWithStatus;
import com.info5100.travel.mapper.PermissionMapper;
import com.info5100.travel.mapper.RoleMapper;
import com.info5100.travel.pojo.Permission;
import com.info5100.travel.pojo.Role;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class RoleService {
    @Autowired
    private RoleMapper roleMapper;
    @Autowired
    private PermissionMapper permissionMapper;

    public Page<Role> findPage(int page, int size){
        return roleMapper.selectPage(new Page(page,size),null);
    }

    public void add(Role role){
        roleMapper.insert(role);
    }

    public Role findById(Integer rid){
        return roleMapper.selectById(rid);
    }

    public void update(Role role){
        roleMapper.updateById(role);
    }

    public void delete(Integer rid){
        roleMapper.deleteById(rid);
    }

    // 查询角色的权限情况
    public List<PermissionWithStatus> findPermission(Integer rid){
        // 查询所有权限
        List<Permission> permissions = permissionMapper.selectList(null);
        // 查询角色拥有的权限id
        List<Integer> pids = permissionMapper.findPermissionIdByRole(rid);
        // 构建带有状态的权限结合
        List<PermissionWithStatus> permissionList = new ArrayList();
        for (Permission permission : permissions) {
            // 创建带有状态的权限
            PermissionWithStatus permissionWithStatus = new PermissionWithStatus();
            BeanUtils.copyProperties(permission,permissionWithStatus);
            // 判断角色是否拥有该权限
            if(pids.contains(permission.getPid())){
                permissionWithStatus.setRoleHas(true);
            }else{
                permissionWithStatus.setRoleHas(false);
            }
            permissionList.add(permissionWithStatus);
        }
        return permissionList;
    }

    // 给角色重新分配权限
    public void updatePermissions(Integer rid,Integer[] ids){
        // 删除角色的所有权限
        roleMapper.deleteRoleAllPermission(rid);
        // 即使代码出现异常↓ 但是数据不会异常，因为有事务的保护@Transactional
        int i = 1/0;
        // 重新给角色添加权限
        for (Integer pid : ids) {
            roleMapper.addRolePermission(rid,pid);
        }
    }
}
