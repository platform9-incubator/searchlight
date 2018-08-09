FROM 514845858982.dkr.ecr.us-west-1.amazonaws.com/base-images:pmo_base_image_centos_7
MAINTAINER rparikh@platform9.com
LABEL com.platform9.image-type=du

COPY etc/ /etc/

RUN pip --no-cache-dir install \
                -chttps://git.openstack.org/cgit/openstack/requirements/plain/upper-constraints.txt?h=83c0abd \
                setuptools==33.1.1 \
                python-openstackclient \
                -e .
# Install uwsgi
RUN pip install uwsgi

# platform9 entrypoints and watchers
COPY init-searchlight

RUN chmod 755 init-searchlight

EXPOSE 8774 8775
CMD ["configure-run-searchlight"]
